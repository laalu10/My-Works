package com.lxi.hungergame.model;

import java.util.ArrayList;
import java.util.List;

public class Forest
{
	 
    private Cell[][] cell = new Cell[10][10];
	private List <Player> gamers = new  ArrayList<>();
	private Dice dice = new Dice();
	private Player activePlayer;
	private int activePlayerCount = 1;
	private List <Player> winners = new ArrayList<>();
	
	


	public void setCell(Cell[][] cell)
	{
		this.cell = cell;
	}
	
	public Cell[][] getCell()
	{
		return cell;
	}
	
	
	
	
	
	public void setGamers(List<Player> players)
	{
		this.gamers = players;
	}
	
	public List <Player> getGamers()
	{
		return gamers;
	}




	
	public Dice getDice() {
		return dice;
	}

	public void setDice(Dice dice) {
		this.dice = dice;
	}

	

	

	public Player getActivePlayer() {
		return activePlayer;
	}

	public void setActivePlayer(Player player) {
		this.activePlayer = player;
	}


	
	
	public int getActivePlayerCount() {
        return activePlayerCount;
    }

    public void setActivePlayerCount(int activePlayerCount) {
        this.activePlayerCount = activePlayerCount;
    }

   



	public List<Player> getWinners() {
        return winners;
    }

    public void setWinners(List<Player> winners) {
        this.winners = winners;
    }





	public void initialize()
	{
		cellCreation();
		createFood();
		createHunter();
		
	}
	
	public void cellCreation()
	{
		int x = 1;
		for (int i = 0;i<10;i++)
		{
		
			for(int j = 0; j<10;j++)
			{
				cell[i][j] = new Cell("/hungergame/images/one.jpg");
				cell[i][j].setCellCount(x) ;
				x++;

			}
				
		}
	}
	
	
	
	public void createFood()
	{

		for (int i =0;i<10;i++)
		{
			Food f1 = new Food("Apple","/hungergame/images/app.jpg",-15);
			int a = (int) (Math.random()*10);
			int b = (int) (Math.random()*10);
			
			cell[a][b].getFoods().add(f1);
		}
		
		for(int j =0;j<10;j++)
		{
			Food f2 = new Food("Orange","/hungergame/images/orange.jpg",-10);
			int c = (int) (Math.random()*10);
			int d = (int) (Math.random()*10);
			
			cell[c][d].getFoods().add(f2);
		}
		
		
		for(int k =0;k<10;k++)
		{
		
			Food f3 = new Food("Meet","/hungergame/images/meet.jpg",-12);
			int e = (int) (Math.random()*10);
			int f = (int) (Math.random()*10);
			
			cell[e][f].getFoods().add(f3);
		}
	}





	public void createHunter()
	{

		for(int  i = 0;i < 10; i++)
		{
			Hunter h1 = new Hunter("hunter","/hungergame/images/hunter1.jpg",10);
			int a = (int) (Math.random()*10);
			int b = (int) (Math.random()*10);
			cell[a][b].getHunters().add(h1);
		}


		for (int j = 0;j <10;j++)
		{
			Hunter h2 = new Hunter("hunter","/hungergame/images/hunter2.jpg",10);
			int c = (int) (Math.random()*10);
			int d = (int) (Math.random()*10);
			cell[c][d].getHunters().add(h2);
		}
	}




	public boolean gameLoop()
	{
		
		int result = activePlayer.rollDice(dice);
		if(activePlayer.getActive())
		{
			int oldCellPosition = activePlayer.getCellposition();
			activePlayer.setCellpositon(activePlayer.getCellposition()+result);
			int newCellPosition = activePlayer.getCellposition();
			int i = (int) (newCellPosition -1)/10;
			int j = (newCellPosition -1) % 10;
			int a = (int) (oldCellPosition-1)/10;
			int b = (oldCellPosition-1)%10;
			
			if(newCellPosition<=100)
			{
				activePlayer.setHungerLevel(activePlayer.getHungerLevel()+result);
				cell[a][b].getPlayers().remove(activePlayer);
				
				if(newCellPosition==100)
				{
					cell[9][9].getPlayers().add(activePlayer);
					getWinners().add(activePlayer);
					getGamers().remove(activePlayer);
					activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
					return true;
				}
				
				boolean x = getCell()[i][j].cellProcessing(activePlayer);

				if (x)
				{
					if(result != 6)
					{
						activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
						return true;

					}
					
					return true;

				}
				else
				{
					activePlayer.setCellpositon(0);
					activePlayer.setActive(false);
					activePlayer.setHungerLevel(0);
					activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
					return false;

				}
				
			}
			else
			{
				activePlayer.setCellpositon(oldCellPosition);
				activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
				return true;
			}

				

		}
		else
		{
			if(result == 1)
			{
				cell[0][0].getPlayers().add(activePlayer);
				activePlayer.setCellpositon(1);
				activePlayer.setActive(true);
				activePlayer.setHungerLevel(0);
				activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
				return true;
			}
		}
		activePlayer = gamers.get((activePlayerCount++)%getGamers().size());
		return true;
	}

   

   
  
}	