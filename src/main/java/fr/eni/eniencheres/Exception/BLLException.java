package fr.eni.eniencheres.Exception;

public class BLLException extends Exception {

    public BLLException(){

    }

    public BLLException(String message, Throwable exc){
        super(message, exc);
    }
}
