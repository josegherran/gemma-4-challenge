# agent_backend.py
# Backend agent entrypoint for webchat and image generation


from agent.roles import WebchatAgentRole
from agent.skills import GenerateImageSkill

class StubAgent:
    def __init__(self, role, skills, name):
        self.role = role
        self.skills = skills
        self.name = name

async def create_agent():
    agent = StubAgent(
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
