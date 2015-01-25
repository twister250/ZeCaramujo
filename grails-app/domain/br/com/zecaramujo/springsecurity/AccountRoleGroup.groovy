package br.com.zecaramujo.springsecurity

import org.apache.commons.lang.builder.HashCodeBuilder

class AccountRoleGroup implements Serializable {

	private static final long serialVersionUID = 1

	Account account
	RoleGroup roleGroup

	boolean equals(other) {
		if (!(other instanceof AccountRoleGroup)) {
			return false
		}

		other.account?.id == account?.id &&
		other.roleGroup?.id == roleGroup?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (account) builder.append(account.id)
		if (roleGroup) builder.append(roleGroup.id)
		builder.toHashCode()
	}

	static AccountRoleGroup get(long accountId, long roleGroupId) {
		AccountRoleGroup.where {
			account == Account.load(accountId) &&
			roleGroup == RoleGroup.load(roleGroupId)
		}.get()
	}

	static boolean exists(long accountId, long roleGroupId) {
		AccountRoleGroup.where {
			account == Account.load(accountId) &&
			roleGroup == RoleGroup.load(roleGroupId)
		}.count() > 0
	}

	static AccountRoleGroup create(Account account, RoleGroup roleGroup, boolean flush = false) {
		def instance = new AccountRoleGroup(account: account, roleGroup: roleGroup)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Account u, RoleGroup g, boolean flush = false) {
		if (u == null || g == null) return false

		int rowCount = AccountRoleGroup.where {
			account == Account.load(u.id) &&
			roleGroup == RoleGroup.load(g.id)
		}.deleteAll()

		if (flush) { AccountRoleGroup.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(Account u, boolean flush = false) {
		if (u == null) return

		AccountRoleGroup.where {
			account == Account.load(u.id)
		}.deleteAll()

		if (flush) { AccountRoleGroup.withSession { it.flush() } }
	}

	static void removeAll(RoleGroup g, boolean flush = false) {
		if (g == null) return

		AccountRoleGroup.where {
			roleGroup == RoleGroup.load(g.id)
		}.deleteAll()

		if (flush) { AccountRoleGroup.withSession { it.flush() } }
	}

	static constraints = {
		account validator: { Account u, AccountRoleGroup ug ->
			if (ug.roleGroup == null) return
			boolean existing = false
			AccountRoleGroup.withNewSession {
				existing = AccountRoleGroup.exists(u.id, ug.roleGroup.id)
			}
			if (existing) {
				return 'userGroup.exists'
			}
		}
	}

	static mapping = {
		id composite: ['roleGroup', 'account']
		version false
	}
}
