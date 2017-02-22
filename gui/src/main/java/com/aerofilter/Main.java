package com.aerofilter;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import javafx.scene.Group;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class Main extends Application {

  @Override
  public void start(Stage primaryStage) {
    primaryStage.setTitle("HTML");
    primaryStage.setWidth(500);
    primaryStage.setHeight(500);
    Scene scene = new Scene(new Group());
    VBox root = new VBox();
    final WebView browser = new WebView();
    final WebEngine webEngine = browser.getEngine();

    webEngine.load("http://localhost:8475");

    root.getChildren().addAll(browser);
    scene.setRoot(root);

    primaryStage.setScene(scene);
    primaryStage.show();
  }

  public static void main(String[] args) throws Exception {
    EmbedServer server = new EmbedServer();
    server.run();

    launch(args);
  }
}
