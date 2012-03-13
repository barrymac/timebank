package timebank

class OfferController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [offerInstanceList: Offer.list(params), offerInstanceTotal: Offer.count()]
    }

    def create = {
        def offerInstance = new Offer()
        offerInstance.properties = params
        return [offerInstance: offerInstance]
    }

    def save = {
        def offerInstance = new Offer(params)
        if (offerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'offer.label', default: 'Offer'), offerInstance.id])}"
            redirect(action: "show", id: offerInstance.id)
        }
        else {
            render(view: "create", model: [offerInstance: offerInstance])
        }
    }

    def show = {
        def offerInstance = Offer.get(params.id)
        if (!offerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [offerInstance: offerInstance]
        }
    }

    def edit = {
        def offerInstance = Offer.get(params.id)
        if (!offerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [offerInstance: offerInstance]
        }
    }

    def update = {
        def offerInstance = Offer.get(params.id)
        if (offerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (offerInstance.version > version) {

                    offerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'offer.label', default: 'Offer')] as Object[], "Another user has updated this Offer while you were editing")
                    render(view: "edit", model: [offerInstance: offerInstance])
                    return
                }
            }
            offerInstance.properties = params
            if (!offerInstance.hasErrors() && offerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'offer.label', default: 'Offer'), offerInstance.id])}"
                redirect(action: "show", id: offerInstance.id)
            }
            else {
                render(view: "edit", model: [offerInstance: offerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def offerInstance = Offer.get(params.id)
        if (offerInstance) {
            try {
                offerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), params.id])}"
            redirect(action: "list")
        }
    }
}
