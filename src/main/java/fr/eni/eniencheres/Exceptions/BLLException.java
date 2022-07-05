package fr.eni.eniencheres.Exceptions;

public class BLLException extends Exception {

    public BLLException(){

    }

    public BLLException(String message, Throwable exc){
        super(message, exc);
    }
}
