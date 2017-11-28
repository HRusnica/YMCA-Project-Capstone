package com.techelevator.model;

public class Skill {
	public String skillName;
	public String skillDescription;
	public boolean introduced;
	public int skillId;
	

	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	public String getSkillDescription() {
		return skillDescription;
	}
	public void setSkillDescription(String skillDescription) {
		this.skillDescription = skillDescription;
	}
	public boolean isIntroduced() {
		return introduced;
	}
	public void setIntroduced(boolean introduced) {
		this.introduced = introduced;
	}
	public int getSkillId() {
		return skillId;
	}
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	
}
