import csv
import argparse
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

def run_gemma_inference_from_csv(csv_file_path: str):
    """
    Reads topics from a CSV file and performs Gemma 3 inference for each.
    """
    print(f"\nReading topics from: {csv_file_path}")
    try:
        with open(csv_file_path, 'r') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                topic = row['topic']
                print(f"\n--- Delegated Topic: {topic} ---")
                run_gemma_inference(topic)
    except FileNotFoundError:
        print(f"Error: CSV file not found at {csv_file_path}")
    except KeyError:
        print(f"Error: 'topic' column not found in {csv_file_path}")
    except Exception as e:
        print(f"An error occurred while reading CSV or running inference: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run Gemma 3 inference.")
    parser.add_argument(
        "--csv",
        type=str,
        help="Path to a CSV file containing topics for inference."
    )
    parser.add_argument(
        "--prompt",
        type=str,
        help="A single prompt for inference."
    )

    args = parser.parse_args()

    if args.csv:
        run_gemma_inference_from_csv(args.csv)
    elif args.prompt:
        run_gemma_inference(args.prompt)
    else:
        # Default behavior if no arguments are provided
        user_prompt = "Write a short, creative story about a robot who discovers a love for painting."
        run_gemma_inference(user_prompt)
