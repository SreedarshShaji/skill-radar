package com.SkillRadar.Test;

import java.security.Provider.Service;
import java.util.ArrayList;

import com.SkillRadar.Entites.Admin;
import com.SkillRadar.Entites.Customer;
import com.SkillRadar.Entites.Feedback;
import com.SkillRadar.Entites.Location;
import com.SkillRadar.Entites.Provider;
import com.SkillRadar.Entites.ServiceCategory;
import com.SkillRadar.Entites.ORM.AdminORM;
import com.SkillRadar.Entites.ORM.CustomerORM;
import com.SkillRadar.Entites.ORM.FeedbackORM;
import com.SkillRadar.Entites.ORM.ProviderORM;
import com.SkillRadar.Entites.ORM.ServiceCategoryORM;

public class Test {

	public static void main(String[] args) {
		try {
			
			Provider provider=new ProviderORM().getProvider("SreedarshShaji@outllook.com", "PlKollam");
			                 System.out.println(provider);
			} catch (Exception e) {
			System.out.println("Test class" + e.getMessage());
		}
	}

}
