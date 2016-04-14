package cz.timony.agiRocks.csv

/**
 * Created by tmika on 4/6/16.
 */
class BooleanConverter implements FieldConverter {

    def trueValues = ['true', 'ano', 'yes', '1']
    def falseValues = ['false', 'ne', 'no', '0']

    @Override
    Object convert(String value) {

        if (trueValues.contains(value.toLowerCase())) {
            return true
        } else if (falseValues.contains(value.toLowerCase())) {
            return false
        }
        throw new Exception("Value $value not valid true/false indicator")
    }
}
