package kr.or.nextit.common.error;

@SuppressWarnings("serial")
public class BizException extends Exception {

	public BizException () {
		super("비니니스 로직 구현상 에러가 발생 !!");
	}
	public BizException (String message) {
		super(message);
	}

	public BizException (String message, Throwable ex) {
		super(message, ex);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
