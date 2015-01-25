import br.com.zecaramujo.springsecurity.Account
import br.com.zecaramujo.springsecurity.AccountRole
import br.com.zecaramujo.springsecurity.Role

class BootStrap {

    def init = { servletContext ->
		def adminRole	= new Role(authority: 'ADMINISTRATOR').save(flush: true)
		def accountRole	= new Role(authority: 'ACCOUNT').save(flush: true)
		def rootAccount = Account.get(1)
		
		if(rootAccount == null){
			root.save(flush: true)
			AccountRole.create(rootAccount, adminRole, true)
		}
    }
	
    def destroy = {
    }
}