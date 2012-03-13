package timebank

class ExchangeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exchangeInstanceList: Exchange.list(params), exchangeInstanceTotal: Exchange.count()]
    }

    def create = {
        def exchangeInstance = new Exchange()
        exchangeInstance.properties = params
        return [exchangeInstance: exchangeInstance]
    }

    def save = {
        def exchangeInstance = new Exchange(params)
        if (exchangeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'exchange.label', default: 'Exchange'), exchangeInstance.id])}"
            redirect(action: "show", id: exchangeInstance.id)
        }
        else {
            render(view: "create", model: [exchangeInstance: exchangeInstance])
        }
    }

    def show = {
        def exchangeInstance = Exchange.get(params.id)
        if (!exchangeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
            redirect(action: "list")
        }
        else {
            [exchangeInstance: exchangeInstance]
        }
    }

    def edit = {
        def exchangeInstance = Exchange.get(params.id)
        if (!exchangeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [exchangeInstance: exchangeInstance]
        }
    }

    def update = {
        def exchangeInstance = Exchange.get(params.id)
        if (exchangeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (exchangeInstance.version > version) {

                    exchangeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'exchange.label', default: 'Exchange')] as Object[], "Another user has updated this Exchange while you were editing")
                    render(view: "edit", model: [exchangeInstance: exchangeInstance])
                    return
                }
            }
            exchangeInstance.properties = params
            if (!exchangeInstance.hasErrors() && exchangeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'exchange.label', default: 'Exchange'), exchangeInstance.id])}"
                redirect(action: "show", id: exchangeInstance.id)
            }
            else {
                render(view: "edit", model: [exchangeInstance: exchangeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def exchangeInstance = Exchange.get(params.id)
        if (exchangeInstance) {
            try {
                exchangeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'exchange.label', default: 'Exchange'), params.id])}"
            redirect(action: "list")
        }
    }
}
