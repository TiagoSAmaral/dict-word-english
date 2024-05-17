//
//  KeyValueParameters.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation

/// KeyValueParameters usado para agrupar parametros de requisições.
///
/// Esses parametros podem ser usados tanto no `HEADER` da requisição ou como lista de parametros a serem enviados.
protocol KeyValueParameters {
    
    /// Lista de parametros do tipo `KeyValueParameter`..
    var elements: [KeyValueParameter]? { get set }
}

/// KeyValueParameter é o item que possui a identificação e o valor para serem inseridos numa requisição.
///
/// Este elemento recebe dois parametros. Um `name` como identifiador, e um `value` com a informação que será inserida na requisição.
///
/// - Parameter:
///     - name: Usado para identificar o valor.
///     - value: Valor transportado pela instancia.
protocol KeyValueParameter {
    var name: String { get set }
    var value: Any { get set }
}
