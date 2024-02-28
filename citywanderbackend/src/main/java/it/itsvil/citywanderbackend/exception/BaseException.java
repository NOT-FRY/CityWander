package it.itsvil.augmenter.exception;

public abstract class BaseException extends Exception {

    private static final long serialVersionUID = 6559056128756621656L;

    private final String message;

    protected BaseException(String msg) {
        super(msg);
        this.message = msg;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
