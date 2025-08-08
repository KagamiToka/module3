package model;

public class Calculator {
    private int firstNumber;
    private String operator;
    private int secondNumber;

    public Calculator() {
    }

    public Calculator(int firstNumber, String operator, int secondNumber) {
        this.firstNumber = firstNumber;
        this.operator = operator;
        this.secondNumber = secondNumber;
    }

    public int getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(int firstNumber) {
        this.firstNumber = firstNumber;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public int getSecondNumber() {
        return secondNumber;
    }

    public void setSecondNumber(int secondNumber) {
        this.secondNumber = secondNumber;
    }

    public double calculate() {
        switch (operator) {
            case "Addition":
                return firstNumber + secondNumber;
            case "Subtraction":
                return firstNumber - secondNumber;
            case "Multiplication":
                return firstNumber * secondNumber;
            case "Division":
                if (secondNumber == 0) throw new ArithmeticException("Cannot divide by zero");
                return (double) firstNumber / secondNumber;
            default:
                throw new IllegalArgumentException("Operator not supported");
        }
    }
}
