<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <#if realm.password>
        <div class="main-content-agile">
		      <div class="sub-main-w3">
                <form id="kc-form-login" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcInputWrapperClass!}">
                            <#if usernameEditDisabled??>
                                <div class="pom-agile">
                					<input id=username" placeholder="Username or email" name="username" class="user" type="text" required="">
                					<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                				</div>
                            <#else>
                                <div class="pom-agile">
                                    <input id=username" placeholder="Username or email" name="username" class="user" type="text" required="">
                                    <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                                </div>
                            </#if>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="pom-agile">
    					<input  placeholder="Password" name="password" class="pass" type="password" required="" autocomplete="off">
    					<span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
    				</div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>

                        <div class="sub-w3l">
        					<div class="right-w3l">
        						<input type="submit" value="Login" id="kc-login">
        					</div>
        				</div>
                    </div>
                </form>
            </div>
        </div>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
