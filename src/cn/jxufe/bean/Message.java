package cn.jxufe.bean;

public class Message{
    private int code;
    private String msg;
    
    
    public Message error500(String msg) {
		this.msg = msg;
		this.code = 500;
		return this;
	}
    
    public Message success(String msg) {
		this.msg = msg;
		this.code = 200;
		return this;
	}
    
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
    
}