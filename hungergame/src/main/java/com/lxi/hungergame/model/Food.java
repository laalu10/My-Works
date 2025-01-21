package com.lxi.hungergame.model;

public class Food
{
	private String name;
	private String foodIcon;
	private int hungerlevel;

	



	public  Food(String name,String icon,int level)
	{
		this.name = name;
		this.foodIcon = icon;
		this.hungerlevel = level;
	}
	
	
	
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	
	
	
	
	public String getFoodIcon()
	{
		return foodIcon;
	}
	
	
	public void setFoodIcon(String icon)
	{
		this.foodIcon = icon;
	}



	
	public int getHungerlevel() {
		return hungerlevel;
	}

	public void setHungerlevel(int level) {
		this.hungerlevel = level;
	}

}
