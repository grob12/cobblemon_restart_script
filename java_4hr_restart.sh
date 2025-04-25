#!/bin/bash

# Path to your Java JAR file
JAR_PATH="fabric-server-mc.1.21.1-loader.0.16.10-launcher.1.0.3.jar"

# Function to start the Java application
start_java_app() {
    echo "Starting Java application..."
    java -Xmx12G -jar "$JAR_PATH" &
    JAVA_PID=$!
    echo "Java application started with PID $JAVA_PID"
}

# Function to stop the Java application
stop_java_app() {
    echo "Stopping Java application with PID $JAVA_PID..."
    kill -SIGTERM "$JAVA_PID"
    echo "Java application stopped."
}

# Start the Java application initially
start_java_app

# Loop to restart the Java application every 4 hours
while true; do
    sleep 1m
    stop_java_app
    start_java_app
done
