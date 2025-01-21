package com.lxi.hungergame.model;

import java.util.ArrayList;
import java.util.List;

public class Cell
{
	private String bgImage; 
	private List <Player> players = new ArrayList<>(); 
	private List <Food> foods = new ArrayList<>();
	private List<Hunter> hunters = new ArrayList<>();
	private int cellCount ;
	


	public Cell(String bgimage){
		this.bgImage = bgimage;
	}


	public void setPlayers(List<Player> players)
	{
	this.players = players;
	}		
	
	public List<Player> getPlayers()
	{
	return players;
	}
	
	
	
	public void setFoods(List<Food> foods)
	{
	this.foods = foods;
	}
	
	public List<Food> getFoods()
	{
	return foods;
	}

	
	
	public String getBgImage() {
		return bgImage;
	}

	public void setBgImage(String bgImage) {
		this.bgImage = bgImage;
	}

	
	
	public List<Hunter> getHunters() {
		return hunters;
	}

	public void setHunters(List<Hunter> hunters) {
		this.hunters = hunters;
	}

	
	
	
	public int getCellCount() {
		return cellCount;
	}

	public void setCellCount(int cellCount) {
		this.cellCount = cellCount;
	}






	public boolean cellProcessing(Player p )
	{
		for(Food f : foods)
		{
			p.setHungerLevel(p.getHungerLevel()+f.getHungerlevel());
		}


		for(Hunter h : hunters)
		{
			if(p.getHungerLevel()>h.getHungerLevel())
			{
				return false;
			}
			else
			{
				p.setHungerLevel(p.getHungerLevel()+1);
			}
		}

		if(p.getHungerLevel()>20)
		{
			return false;
		}
		else
		{
			this.getPlayers().add(p);
			return true;
		}

	}




}