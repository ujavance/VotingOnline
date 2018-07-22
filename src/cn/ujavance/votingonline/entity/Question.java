package cn.ujavance.votingonline.entity;

import java.util.List;

public class Question {
	private String title;
	private List<String> options;
	/*{"title": "你最喜欢的明星？", "options": ["周***","王**","王**","王**"]}*/
	public Question(String title, List<String> option) {
		super();
		this.title = title;
		this.options = option;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getOption() {
		return options;
	}

	public void setOption(List<String> option) {
		this.options = option;
	}

	public Question() {
		super();
	}

	@Override
	public String toString() {
		return "Question [title=" + title + ", option=" + options + "]";
	}
	
	

}
