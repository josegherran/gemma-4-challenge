# roles.py
# Define agent roles for the backend agent (decoupled from UI)

class WebchatAgentRole:
    """
    Role for handling webchat interactions and image generation requests.
    """
    name = "webchat-image-agent"
    description = "Handles chat messages and image generation prompts from the webchat UI."
    # Add more role-specific configuration if needed
