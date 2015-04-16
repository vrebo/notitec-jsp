/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author vrebo
 */
public abstract class Entidad<E> {
    protected E id;

    public E getId() {
        return id;
    }

    public void setId(E id) {
        this.id = id;
    }
}
