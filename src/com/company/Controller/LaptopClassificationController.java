package com.company.Controller;

import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.Spinner;
import javafx.scene.control.TextArea;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class LaptopClassificationController implements Initializable {

    @FXML
    private Spinner<Integer> spinnerBudget;

    @FXML
    private ChoiceBox<String> choiceUsage;

    @FXML
    private ChoiceBox<String> choiceMobility;

    @FXML
    private ChoiceBox<String> choiceOS;

    @FXML
    private Label labelOS;

    @FXML
    private CheckBox checkbox3D;

    @FXML
    private Button buttonRecommend;

    @FXML
    private TextArea outputRecommend;

    private int budget;
    private String mobility;
    private String usage;
    private String os;
    private String renderingType;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        List<String> mobilityList = new ArrayList<>();
        mobilityList.add("High");
        mobilityList.add("Medium");
        mobilityList.add("Low");
        ObservableList<String> observableMobility = FXCollections.observableList(mobilityList);
        choiceMobility.setItems(observableMobility);

        List<String> usageList = new ArrayList<>();
        usageList.add("Gaming");
        usageList.add("Design");
        usageList.add("Casual");
        ObservableList<String> observableUsage = FXCollections.observableList(usageList);
        choiceUsage.setItems(observableUsage);

        List<String> osList = new ArrayList<>();
        osList.add("Windows");
        osList.add("Linux");
        osList.add("iOS");
        ObservableList<String> observableOs = FXCollections.observableList(osList);
        choiceOS.setItems(observableOs);

        choiceOS.setVisible(false);
        checkbox3D.setVisible(false);
        labelOS.setVisible(false);

        choiceUsage.getSelectionModel().selectedItemProperty()
                .addListener((ObservableValue<? extends String> observable, String oldValue, String newValue) -> {
                    if (newValue.equalsIgnoreCase("Casual")){
                        choiceOS.setVisible(true);
                        labelOS.setVisible(true);
                        checkbox3D.setVisible(false);
                    } else if (newValue.equalsIgnoreCase("Design")){
                        checkbox3D.setVisible(true);
                        choiceOS.setVisible(false);
                        labelOS.setVisible(false);
                    } else {
                        checkbox3D.setVisible(false);
                        choiceOS.setVisible(false);
                        labelOS.setVisible(false);
                    }
                });


        buttonRecommend.setOnAction(actionEvent -> {
            mobility = choiceMobility.getValue();
            usage = choiceUsage.getValue();
            os = choiceOS.getValue();
            renderingType = (checkbox3D.isSelected()) ? "3D" : "Simple";
            outputRecommend.setText(usage + " " + mobility + " " + os + " " + renderingType);
        });

    }
}

