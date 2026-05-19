import asyncio
from io import BytesIO

import httpx
import requests
import streamlit as st
from PIL import Image

st.set_page_config(page_title="Gemma 4 Challenge", layout="wide")

st.title("Gemma 4 Challenge: Multi-modal Webchat")


# Two-panel layout: left for settings, right for chat and image
col_settings, col_chat = st.columns([1, 2])

# --- Left Panel: Provider, Model, and Settings ---
with col_settings:
    st.header("Settings")
    provider = st.selectbox(
        "Select Provider",
        ["Ollama", "Vertex AI", "Bedrock", "Azure OpenAI"],
        index=0,
        key="provider_selectbox"
    )
    # Dynamic model list for Ollama
    ollama_models = []
    ollama_error = None
    if provider == "Ollama":
        if st.button("Refresh Ollama Models") or "ollama_models" not in st.session_state:
            try:
                resp = requests.get("http://localhost:11434/api/tags", timeout=2)
                if resp.status_code == 200:
                    data = resp.json()
                    ollama_models = [m["name"] for m in data.get("models", []) if m["name"].startswith("gemma")]
                    st.session_state["ollama_models"] = ollama_models
                else:
                    ollama_error = f"Ollama API error: {resp.status_code}"
            except Exception as e:
                ollama_error = f"Ollama connection error: {e}"
        else:
            ollama_models = st.session_state.get("ollama_models", [])
        if ollama_error:
            st.error(ollama_error)
        if not ollama_models:
            ollama_models = ["gemma:2b", "gemma:7b", "gemma:2b-instruct", "gemma:7b-instruct"]
        model = st.selectbox("Select Model", ollama_models, key="ollama_model_selectbox")
    else:
        model_options = {
            "Vertex AI": ["gemma-4-vertex-standard", "gemma-4-vertex-pro"],
            "Bedrock": ["gemma-4-bedrock-lite", "gemma-4-bedrock-adv"],
            "Azure OpenAI": ["gemma-4-azure-basic", "gemma-4-azure-premium"]
        }
        model = st.selectbox(
            "Select Model",
            model_options.get(provider, ["gemma-4-base"]),
            key=f"model_selectbox_{provider}"
        )
    # Additional settings
    temperature = st.slider("Temperature", min_value=0.0, max_value=1.0, value=0.7, step=0.01)
    max_tokens = st.number_input("Max Tokens", min_value=1, max_value=4096, value=512)
    aspect_ratio = st.selectbox("Aspect Ratio", ["16:9", "3:2", "4:3", "5:4", "Square", "Portrait"])
    formatting = st.selectbox("Formatting", ["Default", "Landscape", "Portrait", "Square"])
    color_guidance = st.color_picker("Color Guidance", value="#ffffff")
    exclude_items = st.text_input("Exclude Items (comma-separated)")

    st.markdown(f"**Formatting:** {formatting}")
    st.markdown(f"**Color Guidance:** {color_guidance}")
    st.markdown(f"**Exclude Items:** {exclude_items}")

    # Store settings in session state for backend use
    st.session_state['settings'] = {
        'provider': provider,
        'model': model,
        'temperature': temperature,
        'max_tokens': max_tokens,
        'aspect_ratio': aspect_ratio,
        'formatting': formatting,
        'color_guidance': color_guidance,
        'exclude_items': exclude_items
    }

with col_chat:
    st.header("Prompt-to-Image Webchat")
    if 'chat_history' not in st.session_state:
        st.session_state['chat_history'] = []
    user_prompt = st.text_input("Enter your prompt to generate an image:")
    if st.button("Generate") and user_prompt:
        # Call FastAPI backend for image generation
        async def fetch_image():
            async with httpx.AsyncClient() as client:
                payload = {
                    "prompt": user_prompt,
                    **st.session_state['settings']
                }
                try:
                    resp = await client.post("http://localhost:8000/generate-image", json=payload, timeout=30)
                    if resp.status_code == 200:
                        data = resp.json()
                        img_url = data.get("image_url", "https://placehold.co/400x300?text=Gemma+4+Image")
                        st.session_state['chat_history'].append((user_prompt, img_url))
                    else:
                        st.warning(f"Backend error: {resp.status_code} {resp.text}")
                except Exception as e:
                    st.warning(f"API call failed: {e}")
        asyncio.run(fetch_image())
    # Display chat history (last 5)
    for prompt, img_url in reversed(st.session_state['chat_history'][-5:]):
        st.markdown(f"**You:** {prompt}")
        response_col1, response_col2 = st.columns([1, 3])
        with response_col2:
            try:
                response = requests.get(img_url)
                img = Image.open(BytesIO(response.content))
                st.image(img, caption="Generated Image", use_column_width=True)
            except Exception:
                st.warning("Could not load image.")

    # --- Gallery Section ---
    st.subheader("Gallery")
    if st.session_state['chat_history']:
        gallery_cols = st.columns(3)
        for idx, (prompt, img_url) in enumerate(reversed(st.session_state['chat_history'])):
            col = gallery_cols[idx % 3]
            with col:
                try:
                    response = requests.get(img_url)
                    img = Image.open(BytesIO(response.content))
                    st.image(img, caption=prompt, use_column_width=True)
                except Exception:
                    st.warning("Could not load image.")
