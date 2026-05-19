import asyncio
from agent.agent_backend import create_agent

async def test():
    agent = await create_agent()
    result = await agent.skills[0].run(prompt='a blue bird under tree', provider='Ollama', model='gemma:2b')
    print(result)

if __name__ == "__main__":
    asyncio.run(test())
