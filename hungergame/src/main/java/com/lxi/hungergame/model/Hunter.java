package com.lxi.hungergame.model;

public class Hunter
{
    private String name;
    private String hunterIcon;
    private int hungerLevel;



 

    public Hunter(String name, String hunterIcon, int hungerlevel) {
        this.name = name;
        this.hunterIcon = hunterIcon;
        this.hungerLevel = hungerlevel;
    }

    

    
    public String getHunterIcon() {
        return hunterIcon;
    }

    public void setHunterIcon(String hunterIcon) {
        this.hunterIcon = hunterIcon;
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }




    public int getHungerLevel() {
        return hungerLevel;
    }

    public void setHungerlevel(int hungerlevel) {
        this.hungerLevel = hungerlevel;
    }


    

}