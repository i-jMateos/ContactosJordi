//
//  ViewController.swift
//  ContactosJordi
//
//  Created by Jordi Mateos Manchado on 14/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var contactos = [Micontacto]()
    
    @IBOutlet weak var TablaContactos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func agregarContacto(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Agregar contacto", message: "Nuevo contacto", preferredStyle: .alert)
        
        alert.addTextField {(nombreAlert) in
            nombreAlert.placeholder = "nombre"
        }
        alert.addTextField {(telefonoAlert) in
            telefonoAlert.placeholder = "telefono"
        }
        alert.addTextField {(direccionAlert) in
            direccionAlert.placeholder = "direccion"
        }
            
            
            //variables para guardar la info del nuevo contacto
            
            
    
            
            let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
                print("Agregar elemento")
                
                guard let nombreAlert = alert.textFields?.first?.text else { return }
                guard let telefonoAlert = alert.textFields?[1].text else { return }
                guard let direccionAlert = alert.textFields?.last?.text else { return }
                
                var newContacto = Micontacto()
                newContacto.nombre = nombreAlert
                newContacto.telefono = Int64(telefonoAlert)
                newContacto.direccion = direccionAlert
                
                self.contactos.append(newContacto)
                self.TablaContactos.reloadData()
                
            }
            
            let actionCancelar = UIAlertAction(title: "cancelar", style: .default, handler: nil)
            
            alert.addAction(actionAceptar)
            alert.addAction(actionCancelar)
            
            present(alert, animated: true,completion: nil)
        }
    }
    
    extension ViewController : UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contactos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let celda = TablaContactos.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            celda.textLabel?.text = contactos[indexPath.row].nombre
            celda.detailTextLabel?.text = String(contactos[indexPath.row].telefono ?? 0)
            return celda
        }
    }
