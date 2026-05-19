# agent_backend.py
# Backend agent entrypoint for webchat and image generation

from strands_agents import Agent
from agent.roles import WebchatAgentRole
from agent.skills import GenerateImageSkill

async def create_agent():
    agent = Agent(
        role=WebchatAgentRole(),
        skills=[GenerateImageSkill()],
        name="WebchatImageAgent"
    )
    return agent

# Example usage (for FastAPI or Streamlit integration):
# from fastapi import FastAPI
# app = FastAPI()
# agent = await create_agent()
# ...
