package com.company;

import com.company.Model.LaptopClassification;
import jess.*;

public class Main {

    public static void main(String[] args) {
        try {
            Rete r = new Rete();
            r.eval("(deffunction square(?n) (return (* ?n ?n)))");
            Value v = r.eval("(square 3)");
            LaptopClassification laptopClassification = new LaptopClassification();
            laptopClassification.printRules();

            System.out.println(v.intValue(r.getGlobalContext()));
        } catch (JessException e) {
            e.printStackTrace();
        }
    }
}
