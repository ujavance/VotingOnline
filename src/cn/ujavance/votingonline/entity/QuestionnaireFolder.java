package cn.ujavance.votingonline.entity;

public class QuestionnaireFolder {
	private String folderId;
	private String folderName;
	public String getFolderId() {
		return folderId;
	}
	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	@Override
	public String toString() {
		return "QuestionnaireFolder [folderId=" + folderId + ", folderName=" + folderName + "]";
	}
	public QuestionnaireFolder(String folderId, String folderName) {
		super();
		this.folderId = folderId;
		this.folderName = folderName;
	}
	public QuestionnaireFolder() {
		super();
	}
	
	

}
