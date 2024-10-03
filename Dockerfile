# Use the official miniconda base image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the environment.yml file into the container
COPY environment.yml .

# Create the conda environment
RUN conda env create -f environment.yml

# Set the default environment for the CMD
ENV PATH /opt/conda/envs/golsa/bin:$PATH

# Copy the rest of your application code to the container
COPY . .

# Expose the port FastAPI will run on
EXPOSE 8000

# Command to run your FastAPI application
CMD ["conda", "run", "-n", "golsa", "uvicorn", "--reload", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

