package com.will.team4final.memberAdmin.model;

public class MemberLevelVO {
	private int levels;
	private String levelName;
	
	public int getLevels() {
		return levels;
	}
	public void setLevels(int levels) {
		this.levels = levels;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	
	@Override
	public String toString() {
		return "MemberLevelVO [levels=" + levels + ", levelName=" + levelName + ", getLevels()=" + getLevels()
				+ ", getLevelName()=" + getLevelName() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
