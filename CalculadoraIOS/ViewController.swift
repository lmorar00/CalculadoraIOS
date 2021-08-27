//
//  ViewController.swift
//  CalculadoraIOS
//
//  Created by Luis Mora Rivas on 24/8/21.
//

import UIKit

class ViewController: UIViewController {

    // Operadores
    enum operador : Int {
        case none = 0,
             suma = 1,
             resta = 2,
             multi = 3,
             div = 4,
             por = 5
            
    }
    
    // Signos
    enum signos : Int {
        case positivo = 1,
             negativo = 2
    }
    
    var operacion: operador?
    var sig = signos.positivo
    var valor1 = ""
    var valor2 = ""
    
    
    // Pantal donde se muestra el resultado
    
    @IBOutlet weak var pantalla: UITextField!
    
    // Butones de la calculadora
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var punto: UIButton!
    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var signo: UIButton!
    @IBOutlet weak var porcentaje:
        UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var bMulti: UIButton!
    @IBOutlet weak var bResta: UIButton!
    @IBOutlet weak var bSuma: UIButton!
    @IBOutlet weak var bIgual: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func abLimpiar(_ sender: Any) {
        valor1 = ""
        valor2 = ""
        operacion = operador.none
        pantalla.text = ""
    }
    
    @IBAction func ab7(_ sender: Any) {
        pantalla.text = pantalla.text! + "7"
    }
    
    @IBAction func ab4(_ sender: Any) {
        pantalla.text = pantalla.text! + "4"
    }
    
    @IBAction func ac1(_ sender: Any) {
        pantalla.text = pantalla.text! + "1"
    }
    
    @IBAction func ab0(_ sender: Any) {
        pantalla.text = pantalla.text! + "0"
    }
    
    @IBAction func acSigno(_ sender: Any) {
        let valor = pantalla.text!
        
        if valor.contains("-") {
           pantalla.text = pantalla.text?.replacingOccurrences(of: "-", with: "")
        } else {
            pantalla.text = "-" + pantalla.text!
        }
    }
    
    @IBAction func ab8(_ sender: Any) {
        pantalla.text = pantalla.text! + "8"
    }
    
    @IBAction func ab5(_ sender: Any) {
        pantalla.text = pantalla.text! + "5"
    }
    
    @IBAction func ab2(_ sender: Any) {
        pantalla.text = pantalla.text! + "2"
    }
    
    @IBAction func abPorcentaje(_ sender: Any) {
        if (valor1 == "" && valor2 == "") {
            let valorFloat1 = (Double(pantalla.text!)) ?? 0
            if valorFloat1 == 0 {
                pantalla.text = "0"
            } else {
                let resultado = valorFloat1 / 100
                if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                    pantalla.text = (String(format: "%.0f", resultado))
                } else {
                    pantalla.text = (String(resultado))
                }
            }
            
        } else if (valor1 != ""){
            valor2 = pantalla.text!
            let valorFloat1 = (Double(valor1)!)
            let valorFloat2 = (Double(valor2)!)
            let resultado = (valorFloat1 * valorFloat2) / 100
            if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                pantalla.text = (String(format: "%.0f", resultado))
            } else {
                pantalla.text = (String(resultado))
            }
            
        }
    }
    
    @IBAction func ab9(_ sender: Any) {
        pantalla.text = pantalla.text! + "9"
    }
    
    @IBAction func ab6(_ sender: Any) {
        pantalla.text = pantalla.text! + "6"
    }
    
    @IBAction func ab3(_ sender: Any) {
        pantalla.text = pantalla.text! + "3"
    }
    
    @IBAction func abPunto(_ sender: Any) {
        let valor = pantalla.text!
        
        if !valor.contains(".") {
            pantalla.text = pantalla.text! + "."
        }
    }
    
    @IBAction func abDivision(_ sender: Any) {
        valor1 = pantalla.text!
        operacion = operador.div
        pantalla.text = ""
    }
    
    @IBAction func abMulti(_ sender: Any) {
        valor1 = pantalla.text!
        operacion = operador.multi
        pantalla.text = ""
    }
    
    @IBAction func abResta(_ sender: Any) {
        valor1 = pantalla.text!
        operacion = operador.resta
        pantalla.text = ""
    }
    
    @IBAction func abSuma(_ sender: Any) {
        valor1 = pantalla.text!
        operacion = operador.suma
        pantalla.text = ""
    }
    
    @IBAction func abIgual(_ sender: Any) {
        valor2 = pantalla.text!
        
        
        //Evalua la operacion seleccionada
        switch operacion {
        case .suma:
            let valor1 = (Double(valor1)!)
            let valor2 = (Double(valor2)!)
            let resultado = valor1 + valor2
            if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                pantalla.text = (String(format: "%.0f", resultado))
            } else {
                pantalla.text = (String(resultado))
            }
            break
        case .resta:
            let valor1 = (Double(valor1)!)
            let valor2 = (Double(valor2)!)
            let resultado = valor1 - valor2
            if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                pantalla.text = (String(format: "%.0f", resultado))
            } else {
                pantalla.text = (String(resultado))
            }
            break
        case .multi:
            let valor1 = (Double(valor1)!)
            let valor2 = (Double(valor2)!)
            let resultado = valor1 * valor2
            if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                pantalla.text = (String(format: "%.0f", resultado))
            } else {
                pantalla.text = (String(resultado))
            }
            break
        case .div:
            let valor1 = (Double(valor1)!)
            let valor2 = (Double(valor2)!)
            let resultado = valor1 / valor2
            if (valor2 != 0) {
                if (resultado.truncatingRemainder(dividingBy: 1) == 0) {
                    pantalla.text = (String(format: "%.0f", resultado))
                } else {
                    pantalla.text = (String(resultado))
                }
            } else {
                pantalla.text = "Error"
            }
            break
        default:
            break
        }
    }
}

