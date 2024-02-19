FROM python:3.11.7-bookworm

ARG FW_VERISON="20230507"

RUN apt install \
        git \
        wget \
        unzip

WORKDIR /app
RUN  git clone https://github.com/JelmerT/cc2538-bsl.git

WORKDIR /app/cc2538-bsl

RUN pip install wheel pyserial intelhex python-magic && \
    pip install .

RUN wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_3.x.0/bin/CC1352P2_CC2652P_launchpad_coordinator_${FW_VERISON}.zip && \
    unzip CC1352P2_CC2652P_launchpad_coordinator_${FW_VERISON}.zip && \
    rm CC1352P2_CC2652P_launchpad_coordinator_${FW_VERISON}.zip && \
    mv CC1352P2_CC2652P_launchpad_coordinator_${FW_VERISON}.hex firmware.hex

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/app/cc2538-bsl/entrypoint.sh" ]