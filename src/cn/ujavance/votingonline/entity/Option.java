package cn.ujavance.votingonline.entity;

import java.util.List;

public class Option {
	private List<String> list;

	public Option(List<String> list) {
		super();
		this.list = list;
	}

	public List<String> getMap() {
		return list;
	}

	public void setMap(List<String> list) {
		this.list = list;
	}
}
