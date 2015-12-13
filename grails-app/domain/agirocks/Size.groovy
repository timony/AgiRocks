package agirocks

/**
 * Created by tmika on 12/1/15.
 */
enum Size {

    S('S'), M('M'), L('L')

    String id

    Size(String id) {
        this.id = id
    }

    @Override
    String toString() {
        id
    }

    String getKey() {
        name()
    }
}