module AdminsBackofficeHelper
    def translate_attribute(object = nil, method = nil)
        if object && method
            object.model.human_attribute_name(method)
        else
            "informe os parametros corretamente!"
        end
    end
end
