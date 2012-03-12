package timebank

class RequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [requestInstanceList: Request.list(params), requestInstanceTotal: Request.count()]
    }

    def create = {
        def requestInstance = new Request()
        requestInstance.properties = params
        return [requestInstance: requestInstance]
    }

    def save = {
        def requestInstance = new Request(params)
        if (requestInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'request.label', default: 'Request'), requestInstance.id])}"
            redirect(action: "show", id: requestInstance.id)
        }
        else {
            render(view: "create", model: [requestInstance: requestInstance])
        }
    }

    def show = {
        def requestInstance = Request.get(params.id)
        if (!requestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
            redirect(action: "list")
        }
        else {
            [requestInstance: requestInstance]
        }
    }

    def edit = {
        def requestInstance = Request.get(params.id)
        if (!requestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [requestInstance: requestInstance]
        }
    }

    def update = {
        def requestInstance = Request.get(params.id)
        if (requestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (requestInstance.version > version) {

                    requestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'request.label', default: 'Request')] as Object[], "Another user has updated this Request while you were editing")
                    render(view: "edit", model: [requestInstance: requestInstance])
                    return
                }
            }
            requestInstance.properties = params
            if (!requestInstance.hasErrors() && requestInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'request.label', default: 'Request'), requestInstance.id])}"
                redirect(action: "show", id: requestInstance.id)
            }
            else {
                render(view: "edit", model: [requestInstance: requestInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def requestInstance = Request.get(params.id)
        if (requestInstance) {
            try {
                requestInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), params.id])}"
            redirect(action: "list")
        }
    }
}
