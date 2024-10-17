import subprocess


def remove_container_if_exists(container_name: str) -> str | None:
    try:
        subprocess.run(["docker", "stop", container_name], check=True)
        subprocess.run(["docker", "rm", container_name], check=True)
        print(f"Removed existing container '{container_name}'.")
        return container_name
    except subprocess.CalledProcessError:
        print(
            f"No existing container named '{container_name}' found or could not be removed."
        )
