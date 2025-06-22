package com.customer;


//This is a custom exception class named CustomNumberFormatException

public class CustomNumberFormatException extends RuntimeException {


 private static final long serialVersionUID = 1L;

 // Default constructor that calls the parent (RuntimeException) default constructor
 public CustomNumberFormatException() {
     super();
 }

 // Constructor that accepts a custom message and passes it to the parent constructor
 public CustomNumberFormatException(String message) {
     super(message);
 }

 // Constructor that accepts both a message and a cause (another throwable)
 // and passes them to the parent constructor for more detailed error reporting
 public CustomNumberFormatException(String message, Throwable cause) {
     super(message, cause);
 }

 // Constructor that accepts only a cause (Throwable object),
 // useful when re-throwing another exception as a CustomNumberFormatException
 public CustomNumberFormatException(Throwable cause) {
     super(cause);
 }
}
