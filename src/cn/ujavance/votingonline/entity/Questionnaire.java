package cn.ujavance.votingonline.entity;

public class Questionnaire {
	
	private String questionnaireId;
	private int idDelete;
	private int isImportant;
	private String questionnaireName;
	public Questionnaire(String questionnaireId, int idDelete, int isImportant, String questionnaireName) {
		super();
		this.questionnaireId = questionnaireId;
		this.idDelete = idDelete;
		this.isImportant = isImportant;
		this.questionnaireName = questionnaireName;
	}
	public Questionnaire() {
		super();
	}
	@Override
	public String toString() {
		return "Questionnaire [questionnaireId=" + questionnaireId + ", idDelete=" + idDelete + ", isImportant="
				+ isImportant + ", questionnaireName=" + questionnaireName + "]";
	}
	public String getQuestionnaireId() {
		return questionnaireId;
	}
	public int getIdDelete() {
		return idDelete;
	}
	public int getIsImportant() {
		return isImportant;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireId(String questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	public void setIdDelete(int idDelete) {
		this.idDelete = idDelete;
	}
	public void setIsImportant(int isImportant) {
		this.isImportant = isImportant;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
	
	
	

}
