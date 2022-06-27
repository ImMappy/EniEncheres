package fr.eni.eniencheres.bll;

public class BLLException extends Exception {

    public BLLException(){

    }

    public BLLException(String message, Throwable exc){
        super(message, exc);
    }
}
