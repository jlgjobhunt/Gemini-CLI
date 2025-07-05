from llama_cpp import Llama

# Path to the Gemma 3 GGUF model
MODEL_PATH = "/home/mephibosheth/AIUX/Google/Gemini-CLI/src/llama-cpp-python/llama-cpp/gemma/gemma-3-4b-it-Q4_K_M.gguf"

def run_gemma_inference(prompt: str):
    """
    Loads the Gemma 3 model and performs inference.
    """
    print(f"Loading model from: {MODEL_PATH}")
    try:
        llm = Llama(model_path=MODEL_PATH, n_ctx=2048, n_gpu_layers=-1) # n_gpu_layers=-1 to offload all layers to GPU if available
        print("Model loaded successfully.")

        print(f"Running inference with prompt: '{prompt}'")
        output = llm(
            prompt,
            max_tokens=128,
            stop=["<|im_end|>"],
            echo=True,
            temperature=0.7,
        )
        print("\n--- Inference Output ---")
        print(output["choices"][0]["text"])
        print("--- End Inference Output ---")
    except Exception as e:
        print(f"An error occurred during model loading or inference: {e}")

if __name__ == "__main__":
    # Example usage
    user_prompt = "Write a short, creative story about a robot who discovers a love for painting."
    run_gemma_inference(user_prompt)
