package com.SkillRadar.Entites;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class CustomDateTime {
	public static void main(String[] args) {
		Date date=toDate("01/12/2019 13:48:12");
		difference(date);
	}
	
	static Date toDate(String stringDate) 
	{
		try {
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = format.parse(stringDate);
		System.out.println(format.format(date)); // Sat Jan 02 00:00:00 GMT 2010
		return date;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	static long difference(Date date)
	{
				Date startDate = date;// Set start date
				Date endDate   =  new Date();// Set end date as now

				long duration  = endDate.getTime() - startDate.getTime();

				long diffInSeconds = TimeUnit.MILLISECONDS.toSeconds(duration);
				long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);
				long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
				long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
				
				System.out.println(diffInSeconds);
				System.out.println(diffInMinutes);
				System.out.println(diffInHours);
				System.out.println(diffInDays);
				
				return diffInSeconds;
	}
}
