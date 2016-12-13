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

    String usage, brand, mobility, designType, result;
    int budget;

    public LaptopClassification() throws JessException {
        rete = new Rete();
        context = rete.getGlobalContext();
        rete.batch("rules.clp");
        usage = "gaming";
        mobility = "light";
        designType = "simple";
        brand = "apple";
        budget = 0;
        //System.out.println(rete.listDefrules().next().toString());
    }

    public void printRules() {
        Iterator it = rete.listDefrules();
        while(it.hasNext()) {
            System.out.println(it.next());
        }
    }

    public void setUsage(String input) {
        usage = input;
    }

    public void setMobility(String input) {
        mobility = input;
    }

    public void setDesignType(String input) {
        designType = input;
    }

    public void setBrand(String input) {
        brand = input;
    }

    public String getResult() {
        return result;
    }

    public void setBudget(int input) {
        if (budget < 0)
            return;
        budget = input;
    }

    public void classify() throws JessException {
        Fact fact = new Fact("attribute", rete);
        fact.setSlotValue("usage", new Value(usage, RU. STRING));
        fact.setSlotValue("mobility", new Value(mobility, RU. STRING));
        fact.setSlotValue("design-type", new Value(designType, RU. STRING));
        fact.setSlotValue("brand", new Value(brand, RU. STRING));
        fact.setSlotValue("budget", new Value(budget, RU. INTEGER));
        rete.assertFact(fact);
        rete.eval("(run)");

        Iterator it;
        it = rete.listFacts();
        while (it.hasNext()) {
            Fact fact2 = (Fact) it.next();
            if ("MAIN::laptop".equals(fact2.getName())) {
                result = fact2.getSlotValue("type").toString();
                System.out.println("YEAHHHSSS");
            }
        }
        rete.eval("(reset)");
    }
}
