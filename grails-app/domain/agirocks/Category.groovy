package agirocks

/**
 * Created by tmika on 12/1/15.
 */
enum Category {

    A1('A1'), A2('A2'), A3('A3')

    String id

    Category(String id) {
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