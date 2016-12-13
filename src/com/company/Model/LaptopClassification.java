package com.company.Model;

import jess.*;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by User on 12/13/2016.
 */
public class LaptopClassification {
    Rete rete;
    Context context;

    public LaptopClassification() throws JessException {
        rete = new Rete();
        context = rete.getGlobalContext();
        rete.batch("rules.clp");
        //System.out.println(rete.listDefrules().next().toString());
    }

    public void printRules() {
        Iterator it = rete.listDefrules();
        while(it.hasNext()) {
            System.out.println(it.next());
        }
    }
}
