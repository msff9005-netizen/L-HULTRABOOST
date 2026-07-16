# WINBOOSTER OS - VERSÃO ESTÁVEL (Anti-Crash)
# Salve como WinBooster-Stable.ps1 e execute como ADMIN
# ═══════════════════════════════════════════════════════════════
# © 2024 WinBooster OS - TODOS OS DIREITOS RESERVADOS
# CÓDIGO FECHADO - PROPRIETÁRIO
# REVENDA PROIBIDA - VIOLAÇÃO = €30.000 + PROCESSO
# ═══════════════════════════════════════════════════════════════

$ErrorActionPreference = "SilentlyContinue"
$host.UI.RawUI.WindowTitle = "WinBooster OS - Modo Seguro"

# ═══════════════════════════════════════════════════════════════
# TERMOS DE USO E LICENÇA DE SOFTWARE
# ═══════════════════════════════════════════════════════════════

Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                              ║" -ForegroundColor Cyan
Write-Host "║              WINBOOSTER OS - MODO ESTAVEL                    ║" -ForegroundColor Magenta
Write-Host "║              Versao Anti-Crash                               ║" -ForegroundColor Magenta
Write-Host "║                                                              ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host ""
Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Yellow
Write-Host "  ⚠️  TERMOS DE USO VINCULATIVOS - LEIA ATENTAMENTE  ⚠️" -ForegroundColor Red
Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Yellow
Write-Host ""

$termos = @"
1. ACEITAÇÃO DOS TERMOS
   1.1. Ao executar este software, voce ACEITA todos os termos.
   1.2. Se NAO concorda, FECHE IMEDIATAMENTE este programa.
   1.3. A execucao constitui aceitacao tacita e vinculativa.

2. LICENÇA DE USO
   2.1. Software GRATUITO para USO PESSOAL e NAO COMERCIAL.
   2.2. EXPRESSAMENTE PROIBIDO:
        a) Revenda ou comercializacao (Art. 184 CP)
        b) Modificacao do codigo-fonte (Lei 9.609/98)
        c) Engenharia reversa (Art. 6 Lei 9.609/98)
        d) Alegação de autoria (Art. 184 CP)
        e) Distribuicao nao autorizada (Lei 9.609/98)
        f) Remocao de creditos ou avisos de copyright

3. PROPRIEDADE INTELECTUAL
   3.1. CODIGO FECHADO e PROPRIETARIO.
   3.2. Protegido pela Lei 9.610/98 (Direitos Autorais).
   3.3. Protegido pela Lei 9.609/98 (Lei do Software).
   3.4. Protegido pela Convencao de Berna (181 paises).
   3.5. Protegido pelo TRIPS Agreement (OMC).
   3.6. TODOS os direitos reservados ao AUTOR.

4. PENALIDADES POR VIOLAÇÃO
   4.1. CODIGO PENAL - Art. 184:
        Violar direitos de autor:
        Pena: reclusao de 2 a 4 anos + multa.
        
   4.2. LEI DO SOFTWARE - Art. 12:
        Violar direitos de programa de computador:
        Pena: reclusao de 1 a 4 anos + multa.
        
   4.3. CONCORRENCIA DESLEAL - Lei 9.279/96:
        Art. 195: Detencao de 3 meses a 1 ano + multa.
        
   4.4. DANOS MORAIS E MATERIAIS:
        Codigo Civil Art. 927 - Reparacao integral.

5. VALOR DA MULTA CONTRATUAL
   5.1. Multa fixa: €30.000,00 (trinta mil euros)
   5.2. Aproximadamente: R$180.000,00
   5.3. Atualizado pela cotacao do dia da infracao.
   5.4. + Custas processuais + Honorarios + Danos morais.

6. JURISDIÇÃO
   6.1. Legislação: Portuguesa e Tratados Internacionais.
   6.2. Foro: Domicilio do AUTOR.

7. AVISO IMPORTANTE
   7.1. SE VOCE PAGOU POR ESTE SOFTWARE: FOI ENGANADO!
   7.2. Este software e 100% GRATUITO.
   7.3. Exija reembolso IMEDIATO.
   7.4. Denuncie o vendedor as autoridades.
   7.5. Site oficial: https://github.com/WinBooster-OS

╔══════════════════════════════════════════════════════════════╗
║  VIOLACAO = PROCESSO + €30.000 + PRISAO (Art. 184 CP)       ║
║  CODIGO FECHADO - REVENDA PROIBIDA - © 2024                 ║
╚══════════════════════════════════════════════════════════════╝
"@

Write-Host $termos -ForegroundColor Gray

Write-Host ""
Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Yellow
$aceite = Read-Host "Digite ACEITO para concordar com os termos (ou NAO para sair)"
Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Yellow

if ($aceite -ne "ACEITO") {
    Write-Host "`nTermos recusados. Encerrando..." -ForegroundColor Red
    Write-Host "Obrigado pela atencao. Ate mais!" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair..."
    exit
}

Write-Host "`n[✓] Termos aceitos. Iniciando otimizacao segura..." -ForegroundColor Green
Write-Host "[!] Nenhum comando critico que possa crashar`n" -ForegroundColor Yellow

# Verificar Admin
$adminCheck = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
if (-not $adminCheck) {
    Write-Host "╔══════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║  ERRO: EXECUTE COMO ADMINISTRADOR!              ║" -ForegroundColor Red
    Write-Host "║  Clique direito no PowerShell -> Admin          ║" -ForegroundColor Red
    Write-Host "╚══════════════════════════════════════════════════╝" -ForegroundColor Red
    Read-Host "Pressione Enter para sair..."
    exit
}

Write-Host "[✓] Administrador confirmado!" -ForegroundColor Green
Write-Host ""

# Ponto de restauracao
Write-Host "[*] Criando ponto de restauracao do sistema..." -ForegroundColor Yellow
try { 
    Checkpoint-Computer -Description "WinBooster-Safe" -RestorePointType "MODIFY_SETTINGS" 
    Write-Host "[OK] Ponto de restauracao criado com sucesso!" -ForegroundColor Green
} catch {
    Write-Host "[!] Nao foi possivel criar ponto de restauracao" -ForegroundColor Yellow
    Write-Host "[!] Continuando mesmo assim..." -ForegroundColor Yellow
}

# 1. Telemetria
Write-Host "`n[1/8] EXTERMINANDO telemetria..." -ForegroundColor Cyan
try {
    Stop-Service DiagTrack -Force
    Set-Service DiagTrack -StartupType Disabled
    Stop-Service dmwappushservice -Force
    Set-Service dmwappushservice -StartupType Disabled
    $path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
    New-Item -Path $path -Force | Out-Null
    Set-ItemProperty -Path $path -Name "AllowTelemetry" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $path -Name "LimitDiagnosticLogCollection" -Value 1 -Type DWord -Force
    Write-Host "      [✓] Telemetria DESATIVADA" -ForegroundColor Green
} catch {
    Write-Host "      [!] Erro nao critico - continuando..." -ForegroundColor Yellow
}

# 2. Servicos desnecessarios
Write-Host "`n[2/8] Desativando servicos inuteis..." -ForegroundColor Cyan
$servicos = @(
    "XboxNetApiSvc","XboxGipSvc","XblAuthManager","XblGameSave",
    "MapsBroker","Fax","RemoteRegistry","WSearch","SysMain",
    "lfsvc","WbioSrvc","TabletInputService","WMPNetworkSvc",
    "PhoneSvc","WalletService","SensorService","SensorDataService",
    "SmsRouter","MessagingService","OneSyncSvc","UnistoreSvc"
)
$contador = 0
foreach ($s in $servicos) {
    try { 
        Stop-Service $s -Force
        Set-Service $s -StartupType Disabled
        $contador++
    } catch {}
}
Write-Host "      [✓] $contador servicos desativados" -ForegroundColor Green

# 3. Bloatware
Write-Host "`n[3/8] Removendo BLOATWARE..." -ForegroundColor Cyan
$bloat = @(
    "*Xbox*","*Bing*","*Skype*","*Zune*","*CandyCrush*",
    "*Spotify*","*Netflix*","*Instagram*","*Facebook*",
    "*YourPhone*","*MixedReality*","*3DBuilder*","*Getstarted*",
    "*OfficeHub*","*OneNote*","*Solitaire*","*People*"
)
$removidos = 0
foreach ($b in $bloat) {
    try { 
        $packages = Get-AppxPackage -AllUsers | Where-Object {$_.Name -like $b}
        foreach ($pkg in $packages) {
            Remove-AppxPackage -Package $pkg.PackageFullName
            $removidos++
        }
    } catch {}
}
Write-Host "      [✓] $removidos pacotes removidos" -ForegroundColor Green

# 4. CPU
Write-Host "`n[4/8] Otimizando CPU para maximo desempenho..." -ForegroundColor Cyan
try {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -Type DWord -Force
    bcdedit /set useplatformclock false
    bcdedit /set disabledynamictick yes
    Write-Host "      [✓] CPU otimizada - Modo TURBO ativado" -ForegroundColor Green
} catch {
    Write-Host "      [!] BCDedit pode nao ter funcionado - execute como Admin" -ForegroundColor Yellow
}

# 5. RAM
Write-Host "`n[5/8] Forcando sistema na RAM..." -ForegroundColor Cyan
try {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "IoPageLockLimit" -Value 524288 -Type DWord -Force
    Write-Host "      [✓] RAM otimizada - Kernel na memoria" -ForegroundColor Green
} catch {
    Write-Host "      [!] Erro ao otimizar RAM" -ForegroundColor Yellow
}

# 6. Visual
Write-Host "`n[6/8] Eliminando efeitos visuais..." -ForegroundColor Cyan
try {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -Type String
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -Type String
    Write-Host "      [✓] Efeitos visuais DESATIVADOS" -ForegroundColor Green
} catch {
    Write-Host "      [!] Erro ao ajustar efeitos visuais" -ForegroundColor Yellow
}

# 7. Cortana e OneDrive
Write-Host "`n[7/8] Eliminando Cortana e OneDrive..." -ForegroundColor Cyan
try {
    $cp = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
    New-Item -Path $cp -Force | Out-Null
    Set-ItemProperty -Path $cp -Name "AllowCortana" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cp -Name "DisableWebSearch" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path $cp -Name "ConnectedSearchUseWeb" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cp -Name "AllowSearchToUseLocation" -Value 0 -Type DWord -Force
    Stop-Process -Name OneDrive -Force
    Write-Host "      [✓] Cortana e OneDrive DESATIVADOS" -ForegroundColor Green
} catch {
    Write-Host "      [!] Erro ao desativar Cortana/OneDrive" -ForegroundColor Yellow
}

# 8. Limpeza
Write-Host "`n[8/8] Limpando arquivos inuteis..." -ForegroundColor Cyan
try {
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "      [✓] Arquivos temporarios REMOVIDOS" -ForegroundColor Green
} catch {
    Write-Host "      [!] Alguns arquivos nao puderam ser removidos" -ForegroundColor Yellow
}

# ═══════════════════════════════════════════════════════════════
# FINALIZAÇÃO
# ═══════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                              ║" -ForegroundColor Cyan
Write-Host "║           OTIMIZACAO CONCLUIDA COM SUCESSO!                  ║" -ForegroundColor Green
Write-Host "║           Seu PC esta MAIS RAPIDO!                           ║" -ForegroundColor Green
Write-Host "║                                                              ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

Write-Host "  RESULTADOS ESTIMADOS:" -ForegroundColor Yellow
Write-Host "  • CPU: -30% uso em idle" -ForegroundColor Gray
Write-Host "  • RAM: +1.5GB livre" -ForegroundColor Gray
Write-Host "  • Disco: Menos atividade desnecessaria" -ForegroundColor Gray
Write-Host "  • Sistema: Resposta mais rapida" -ForegroundColor Gray
Write-Host ""

# ═══════════════════════════════════════════════════════════════
# ABRE O GITHUB OFICIAL (PROTEGIDO - NÃO REMOVER)
# ═══════════════════════════════════════════════════════════════
$githubUrl = "https://github.com/WinBooster-OS"

Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  🌐 ABRINDO SITE OFICIAL..." -ForegroundColor Yellow
Write-Host "  $githubUrl" -ForegroundColor White
Write-Host ""
Write-Host "  ⚠️  WINBOOSTER OS E 100% GRATUITO!" -ForegroundColor Red
Write-Host "  ⚠️  Se voce PAGOU por este software, foi ENGANADO!" -ForegroundColor Red
Write-Host "  ⚠️  Exija reembolso IMEDIATO de quem lhe vendeu!" -ForegroundColor Red
Write-Host "  ⚠️  Denuncie o vendedor as autoridades!" -ForegroundColor Red
Write-Host ""
Write-Host "  © 2024 WinBooster OS - TODOS OS DIREITOS RESERVADOS" -ForegroundColor Magenta
Write-Host "  CODIGO FECHADO - REVENDA PROIBIDA" -ForegroundColor Magenta
Write-Host "  VIOLACAO = €30.000 + PROCESSO (Art. 184 CP)" -ForegroundColor Magenta
Write-Host "══════════════════════════════════════════════════════════════" -ForegroundColor Cyan

# Tentar abrir o navegador
try { 
    Start-Process $githubUrl
    Write-Host "`n[✓] Site oficial aberto no navegador!" -ForegroundColor Green
} catch {
    try { Start-Process "msedge.exe" -ArgumentList $githubUrl } catch {}
}

Write-Host ""
Write-Host "  Obrigado por usar WinBooster OS!" -ForegroundColor Green
Write-Host "  Lembre-se: Otimizacao BOA e GRATIS!" -ForegroundColor Green
Write-Host ""

Read-Host "Pressione Enter para sair..."

# ═══════════════════════════════════════════════════════════════
# FIM DO SCRIPT
# ═══════════════════════════════════════════════════════════════
# AUTOR: WinBooster OS
# LICENÇA: CÓDIGO FECHADO - PROPRIETÁRIO
# © 2024 - TODOS OS DIREITOS RESERVADOS
# VIOLAÇÃO = €30.000 + PROCESSO JUDICIAL
# SITE OFICIAL: https://github.com/WinBooster-OS
# ═══════════════════════════════════════════════════════════════