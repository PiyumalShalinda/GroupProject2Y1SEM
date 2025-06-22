package com.pharmacist;

public class CustomNumberFormatException extends RuntimeException {
    private static final long serialVersionUID = 1L;

  
    public CustomNumberFormatException() {
        super();
    }

   
    public CustomNumberFormatException(String message) {
        super(message);
    }

   
    public CustomNumberFormatException(String message, Throwable cause) {
        super(message, cause);
    }

    
    public CustomNumberFormatException(Throwable cause) {
        super(cause);
    }
}