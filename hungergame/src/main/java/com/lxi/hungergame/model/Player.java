package com.lxi.hungergame.model;

public class Player
{
	private String name;
	private String playerIcon;
	private boolean active = false;
	private int cellPosition = 0;
	private  int hungerLevel =0;
	private int result;
	
	
	
	
	

	public Player(String name,String icon)
	{
		this.name = name;
		this.playerIcon = icon;
	}



	public int rollDice(Dice d)
	{
		 result = d.roll();
        return result;
	}

	



	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	
	public String getPlayerIcon()
	{
		return playerIcon;
	}
	
	public void setPlayerIcon(String icon)
	{
		this.playerIcon = icon;
	}
	
	
	
	public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
	
	
	
	
	
	
	public int getCellposition()
	{
		return cellPosition;
	}
	
	public void setCellpositon(int position)
	{
		this.cellPosition = position;
	}




	
	public int getHungerLevel() {
		return hungerLevel;
	}

	public void setHungerLevel(int hungerlevel) {
		this.hungerLevel = hungerlevel;
	}

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    

  




 
}