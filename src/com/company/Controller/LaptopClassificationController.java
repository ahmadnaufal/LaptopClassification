package com.company.Controller;

import com.company.Model.LaptopClassification;
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
import jess.JessException;

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
    private Label labelMobility;

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
        try {
            LaptopClassification lp = new LaptopClassification();

            List<String> mobilityList = new ArrayList<>();
            mobilityList.add("High");
            mobilityList.add("Medium");
            mobilityList.add("Light");
            ObservableList<String> observableMobility = FXCollections.observableList(mobilityList);
            choiceMobility.setItems(observableMobility);
            choiceMobility.getSelectionModel().selectFirst();

            List<String> usageList = new ArrayList<>();
            usageList.add("Gaming");
            usageList.add("Design");
            usageList.add("Office");
            ObservableList<String> observableUsage = FXCollections.observableList(usageList);
            choiceUsage.setItems(observableUsage);
            choiceUsage.getSelectionModel().selectFirst();

            List<String> osList = new ArrayList<>();
            osList.add("Windows");
            osList.add("Linux");
            osList.add("iOS");
            ObservableList<String> observableOs = FXCollections.observableList(osList);
            choiceOS.setItems(observableOs);
            choiceOS.getSelectionModel().selectFirst();

            choiceOS.setVisible(false);
            checkbox3D.setVisible(false);
            labelOS.setVisible(false);

            spinnerBudget.getEditor().setText("0");

            choiceUsage.getSelectionModel().selectedItemProperty()
                    .addListener((ObservableValue<? extends String> observable, String oldValue, String newValue) -> {
                        if (newValue.equalsIgnoreCase("Office")) {
                            choiceOS.setVisible(true);
                            labelOS.setVisible(true);
                            checkbox3D.setVisible(false);
                            choiceMobility.setVisible(false);
                            labelMobility.setVisible(false);
                        } else if (newValue.equalsIgnoreCase("Design")) {
                            checkbox3D.setVisible(true);
                            choiceOS.setVisible(false);
                            labelOS.setVisible(false);
                            choiceMobility.setVisible(false);
                            labelMobility.setVisible(false);
                        } else {
                            checkbox3D.setVisible(false);
                            choiceOS.setVisible(false);
                            labelOS.setVisible(false);
                            choiceMobility.setVisible(true);
                            labelMobility.setVisible(true);
                        }
                    });


            buttonRecommend.setOnAction(actionEvent -> {
                outputRecommend.clear();

                try {
                    mobility = choiceMobility.getValue();
                    usage = choiceUsage.getValue();
                    os = (choiceOS.getValue().equalsIgnoreCase("iOS")) ? "apple" : "non-apple";
                    renderingType = (checkbox3D.isSelected()) ? "3d" : "simple";

                    lp.setBrand(os);
                    lp.setMobility(mobility.toLowerCase());
                    lp.setBudget(Integer.parseInt(spinnerBudget.getEditor().getText()));
                    lp.setDesignType(renderingType);
                    lp.setUsage(usage.toLowerCase());
                    lp.classify();
                    String out;
                    String type = lp.getResult().toUpperCase();
                    if (type.equalsIgnoreCase("\"Nabung\"")){
                        out = "Sebaiknya anda menabung terlebih dahulu";
                    } else {
                        out = "Laptop yang cocok untuk Anda adalah " + type;
                    }
                    outputRecommend.setText(out);

                } catch (JessException e) {
                    e.printStackTrace();
                    outputRecommend.setText("Error Jess");
                } catch (NullPointerException ne){
                    outputRecommend.setText("Error Null Pointer");
                }

            });
        } catch (Exception e){
            e.printStackTrace();
        }

    }
}

