# #!/bin/bash
# # Wrapper script to load all models from ai-models folder
#
# # Define the folder containing your models
# GGUF_FOLDER="${1:-/home/sercharm/.build/LLM/ai-models}"
#
# # Build the command with all .gguf files found
# COMMAND="llama-server --models-preset $HOME/.build/LLM/model.ini --sleep-idle-seconds 900"
#
# # Add all .gguf files to the command
# for model in "$GGUF_FOLDER"/*.gguf; do
#     if [ -f "$model" ]; then
#         COMMAND="$COMMAND --model $model"
#         echo "Found model: $model"
#     fi
# done
# #
# # # Execute the command
# # eval "$COMMAND"


#!/bin/bash

# Define the folder containing your models
GGUF_FOLDER="${1:-/home/sercharm/.build/LLM/ai-models}"

# Initialize base command
COMMAND="llama-server --models-preset $HOME/.build/LLM/model.ini --sleep-idle-seconds 900"

# Prioritize specific model types
PRIORITY_MODELS=""

# Add Unsloth models if present
for model in "$GGUF_FOLDER"/*UnSloth*.gguf; do
    if [ -f "$model" ]; then
        PRIORITY_MODELS="$PRIORITY_MODELS --model $model"
        echo "Prioritized Unsloth model: $(basename "$model")"
    fi
done

# Add Qwen models if present
for model in "$GGUF_FOLDER"/*Qwen*.gguf; do
    if [ -f "$model" ]; then
        PRIORITY_MODELS="$PRIORITY_MODELS --model $model"
        echo "Prioritized Qwen model: $(basename "$model")"
    fi
done

# Append remaining models
if [ -d "$GGUF_FOLDER" ] && [ "$(ls -A $GGUF_FOLDER 2>/dev/null)" ]; then
    for model in "$GGUF_FOLDER"/*.gguf; do
        if [ -f "$model" ] && ! echo "$PRIORITY_MODELS" | grep -q "$model"; then
            PRIORITY_MODELS="$PRIORITY_MODELS --model $model"
            echo "Added model: $(basename "$model")"
        fi
    done
fi

# Execute command
eval "$COMMAND"

