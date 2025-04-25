#!/bin/bash

# Path to your Java JAR file
JAR_PATH="path to the jar file that launches the intance. ie fabric-server-mc.1.21.1-loader.0.16.10-launcher.1.0.3.jar "

# Function to start the Java application
start_java_app() {
    echo "Starting Java application..."
    rm "directory to session.lock file usually in world directory"
# This removes the world lock that happens when a crash happens and prevents more than one instance running at a time
    java -Xmx12G -jar "$JAR_PATH" &
    JAVA_PID=$!
    echo "Java application started $JAVA_PID"
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
    sleep 4h
    stop_java_app
    start_java_app
done
